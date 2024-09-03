import { Login } from "@/components/Login";
import React from "react";
import { useState } from "react";
import { Text, View } from "react-native";
import { Router } from "expo-router";
import { useAuth } from "@/components/Auth";
import { Button, Card } from "react-native-paper";
import { Signup } from "@/components/Signup";

export default function LoginPage() {
  const [signupTrue, setSignupTrue] = useState(false);

  const alreadyHaveAccountText = "Already have an account?";
  const needToCreateAccountText = "Need to create an account?";
  return (
    <View style={{ top: 100 }}>
      {!signupTrue && <Login />}
      {signupTrue && <Signup />}
      <Button
        onPress={() => setSignupTrue(!signupTrue)}
        mode="contained"
        style={{ top: 20 }}
      >
        {signupTrue ? alreadyHaveAccountText : needToCreateAccountText}
      </Button>
    </View>
  );
}
