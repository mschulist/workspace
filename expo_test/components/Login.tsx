import React from "react";
import { useState } from "react";
import { Button, Text, TextInput } from "react-native-paper";
import { login } from "@/auth/login";

export function Login() {
  const [studentID, setStudentID] = useState("");
  const [password, setPassword] = useState("");

  return (
    <>
      <Text>Student ID</Text>
      <TextInput value={studentID} onChangeText={setStudentID} />
      <Text>Password</Text>
      <PasswordTextInput password={password} setPassword={setPassword} />
      <Button
        mode="contained-tonal"
        onPress={() => {
          login(studentID, password).catch((error) => {
            console.log(error.message);
            alert(error.message);
          });
        }}
      >
        Login
      </Button>
    </>
  );
}

function PasswordTextInput({
  password,
  setPassword,
}: {
  password: string;
  setPassword: (password: string) => void;
}) {
  const [hidePassword, setHidePassword] = useState<boolean>(true);
  return (
    <TextInput
      value={password}
      onChangeText={setPassword}
      secureTextEntry={hidePassword}
      autoCapitalize="none"
      right={
        <TextInput.Icon
          icon="eye"
          onPress={() => setHidePassword(!hidePassword)}
        />
      }
    />
  );
}
