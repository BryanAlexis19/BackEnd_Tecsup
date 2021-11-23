var admin = require("firebase-admin");

var serviceAccount = require("./tokenfirebase.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://codigog4-6e8eb-default-rtdb.firebaseio.com"
});

console.log('Estas conectado a firebase')

const fs = admin.firestore();

async function getAll(db){
  const compras = db.collection('compras');
  const snapshot = await compras.get();
  snapshot.forEach(doc => {
    console.log(doc.id, '=>', doc.data())
  });
}

getAll(fs);


/* var db = admin.database();
var ref = db.ref("/");

const compraRef = ref.child('/');

compraRef.set({
    compras : {
        nombre: 'camotes',
        cantidad: 1,
        precio: 20
    }
}) 


console.log("compra creada")  */