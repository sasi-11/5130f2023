function isemail(email) {
    var emailFormat = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (email !== "" && email.match(emailFormat)) {
      return true;
    }
  
    return false;
  }
  
  console.log("Email :", isemail("kalam@s.com"));
  console.log("Email:", isemail("bbbb.in"));
  console.log("Email:", isemail("tiny@1.testing"));
  console.log("Email:", isemail("kalamsasikiran@gmail.com"));
  
  function isPhoneNumber(number) {
    var numberFormat = /^\+?[0-9()-.\s]{10,20}$/;
    if (numberFormat.test(number)) {
      return true;
    }
  
    return false;
  }
  console.log("Phone Number", isPhoneNumber("9789967555"));
  console.log("Phone Number", isPhoneNumber("9879957884k"));
  console.log("Phone Number", isPhoneNumber("+1 (541)-245-2345"));
  
  function isValidDomain(domain) {
    var domainRegex =
      /^(https?|ftp):\/\/[A-Za-z0-9-]+\.[A-Za-z0-9]+(\/[A-Za-z0-9-_.]*)*$/;
    return domainRegex.test(domain);
  }
  
  var domainToCheck = "sasikiran.me";
  if (isValidDomain(domainToCheck)) {
    console.log(domainToCheck + " is a valid domain.");
  } else {
    console.log(domainToCheck + " is not a valid domain.");
  }