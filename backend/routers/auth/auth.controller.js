require('dotenv').config();
const AWS = require('aws-sdk');
const { createUser } = require('../../models/auth/donor.model');



const clientId = process.env.CLIENT_ID;
const accessKey = process.env.ACCESS_KEY;
const secretAccessKey = process.env.SECRET_ACCESS_KEY;

AWS.config.update({ region: process.env.REGION , accessKeyId: accessKey,
secretAccessKey: secretAccessKey}); 
const cognito = new AWS.CognitoIdentityServiceProvider();



// Function to sign up a user with phone number and verify using SMS


async function signUpUser(req,res) {
    const { email, password } = req.body;
  
  const params = {
    ClientId: clientId,
    Password: password,
    Username: email,
  };
  
  cognito.signUp({
    ClientId: params.ClientId,
    Username: params.Username,
    Password: params.Password,
  }, (err, data) => {
    if (err) {
      console.error('Error registering user:', err);
      res.status(500).json({ error: 'Error registering user' });
    } else {
      console.log('User registered successfully:', data);
      createUser(data.UserSub);
      res.json({ message: 'User registered successfully',userId:data.UserSub});
    }
  });
  createUser("ABCDE")
}

async function verifyUser(req,res){
    const { email, code } = req.body;
  
    const params = {
      ClientId: clientId,
      ConfirmationCode: code,
      Username: email,
    };
    
    cognito.confirmSignUp(params, (err, data) => {
      if (err) {
        console.error('Error verifying user:', err);
        res.status(500).json({ error: 'Error verifying user' });
      } else {
        console.log('User verified successfully:', data);
        res.json({ message: 'User verified successfully'});
      }
    });
}

async function signInUser(req,res){
    const { email, password } = req.body;
  
  const params = {
    AuthFlow: 'USER_PASSWORD_AUTH',
    ClientId: clientId,
    AuthParameters: {
      USERNAME: email,
      PASSWORD: password,
    },
  };
  
  cognito.initiateAuth(params, (err, data) => {
    if (err) {
      console.error('Error signing in user:', err);
      res.status(500).json({ error: 'Error signing in user' });
    } else {
      console.log('User signed in successfully:', data);
      res.json({ message: 'User signed in successfully' ,token:data.AuthenticationResult.AccessToken});
    }
  });
}

module.exports = {
    signUpUser,
    verifyUser,
    signInUser
}