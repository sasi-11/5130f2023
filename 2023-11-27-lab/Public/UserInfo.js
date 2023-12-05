var firebaseConfig = {
  apiKey: "dc296fa8e03a9d1cd3fab9ec62e044c0",
  authDomain: "pwaiws.firebaseapp.com",
  databaseURL: "https://pwaiws-default-rtdb.firebaseio.com/",
  projectId: "pwa",
  storageBucket: "pwa.appspot.com",
  messagingSenderId: "148275826259",
  appId: "1:148275826259:web:779c61aebccae55c361eae",
};

firebase.initializeApp(firebaseConfig);

var database = firebase.database();

function onSubmit() {
  database.ref("data").set({
    email: document.getElementById("email").value,
    password: document.getElementById("password").value,
  });
  reset();
  database.ref("data").once("value", function (snapshot) {
    var data = snapshot.val();
    alert(
      "Thank you " +
        data.fname +
        " For Submitting Form and details saved in database"
    );
    console.log(data.name);
    console.log(data.age);
  });
}

function reset() {
  document.getElementById("fname").value = "";
  document.getElementById("lname").value = "";
  document.getElementById("email").value = "";
  document.getElementById("gender").value = "";
  document.getElementById("cl").value = "";
  document.getElementById("dob").value = "";
  document.getElementById("live").value = "";
  document.getElementById("thingslove").value = "";
}