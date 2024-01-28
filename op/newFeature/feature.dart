
try {
  Tatti userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: 'barry.allen@example.com',
    password: 'SuperSecretPassword!'
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
  print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
  print('Wrong password provided for that user.');
  }
}
