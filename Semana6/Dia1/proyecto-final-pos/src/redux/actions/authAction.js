import { URL_BACKEND } from '../../environments/environments';
import {
	FIN_CARGANDO_LOGIN,
	INICIO_CARGANDO_LOGIN,
	SET_SUCCESS_LOGIN
} from '../types/types';
import axios from 'axios';

const inicioCargandoLogin = () => {
	return {
		type: INICIO_CARGANDO_LOGIN
	};
};
const finCargandoLogin = () => {
	return {
		type: FIN_CARGANDO_LOGIN
	};
};

export const iniciarSesionAction = (correo, password) => {
	return async (dispatch) => {
		dispatch(inicioCargandoLogin());

		//const endpoint = `${URL_BACKEND}/login`;
		const endpoint = `http://127.0.0.1:8000/api/token/`;
		const response = await axios.post(
			endpoint,
			JSON.stringify({ username: correo, password: password }),
			{
				headers: {
					'Content-type': 'application/json'
				}
			}
		);
		if (response.status === 200) {
			console.log(response.data);
			let  token  = response.data.access;
			localStorage.setItem('token', token);
			console.log(token);
			let payload = token.split('.')[1];
			let payloadDecoded = atob(payload);
			let payloadJSON = JSON.parse(payloadDecoded);
			dispatch({
				type: SET_SUCCESS_LOGIN,
				payload: {
					autenticado: true,
					usu_id: payloadJSON.usu_id,
					token: token
				}
			});
		}
		dispatch(finCargandoLogin());
	};
};

export const iniciarSesionLocalStorage = () => {
	return async (dispatch) => {
		dispatch(inicioCargandoLogin());
		let token = localStorage.getItem('token');
		//let token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM2NTA5NDIzLCJpYXQiOjE2MzY1MDU4MjMsImp0aSI6IjdkM2VmZmJhMzYyMzQ5YWNhNWQ5ZTU2YzkyNWY4NjFkIiwidXNlcl9pZCI6M30.ZOsYhvFuAsyIi2YTurg9KDZEpZHa6UOqnx3jdKfoUjQ';
		try {
			if (token) {
				const endpoint = `${URL_BACKEND}/auth/empleado`;
				const response = await axios.post(endpoint, null, {
					headers: {
						authorization: `bearer ${token}`
					}
				});
				if (response.data.ok) {
					console.log(response.data.content.empleado_nom);
					let payload = token.split('.')[1];
					let payloadDecoded = atob(payload);
					let payloadJSON = JSON.parse(payloadDecoded);
					localStorage.setItem('empleado_nom', response.data.content.empleado_nom);
					dispatch({
						type: SET_SUCCESS_LOGIN,
						payload: {
							autenticado: true,
							usu_id: payloadJSON.usu_id,
							token: token
						}
					});
					dispatch(finCargandoLogin());
				}
			} else {
				dispatch(finCargandoLogin());
			}
		} catch (error) {
			console.log('errosh');
			localStorage.removeItem('token');
			dispatch(finCargandoLogin());
		}
	};
};
