import React from "react";
import { useState } from "react";
import { Button, Card, Text, TextInput } from "react-native-paper";
import { useAuth } from "./Auth";

export function Login() {
  const [studentID, setStudentID] = useState("");
  const [password, setPassword] = useState("");

  const { login } = useAuth();

  return (
    <Card>
      <Card.Title title="Login" />
      <Card.Content>
        <Text>Student ID</Text>
        <TextInput value={studentID} onChangeText={setStudentID} />
        <Text>Password</Text>
        <PasswordTextInput password={password} setPassword={setPassword} />
        <Button
          mode="contained-tonal"
          onPress={() => {
            login(studentID, password);
          }}
        >
          Login
        </Button>
      </Card.Content>
    </Card>
  );
}

export function PasswordTextInput({
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
