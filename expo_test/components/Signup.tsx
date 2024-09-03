import React, { SetStateAction, useEffect } from "react";
import { useState } from "react";
import { Card, Text, TextInput, Button } from "react-native-paper";
import { PasswordTextInput } from "./Login";
import { SignupRequest } from "@/auth/authModel";
import { signup } from "@/auth/login";
import { PhoneNumberInput } from "react-native-paper-phone-number-input";
import { useAuth } from "./Auth";

export function Signup() {
  const [studentID, setStudentID] = useState("");
  const [password, setPassword] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState<string>();
  const [code, setCode] = useState<string>("US");

  const [allFieldsFilled, setAllFieldsFilled] = useState(false);

  const { setAuth } = useAuth();

  function validateEmail() {
    if (email.includes("@") && email.includes(".")) {
      return true;
    } else {
      return false;
    }
  }

  function validatePhone() {
    return phone?.length === 10;
  }

  function setValidPhone(value: SetStateAction<string | undefined>) {
    const numericPhone =
      typeof value === "string" ? value.replace(/[^0-9]/g, "") : "";
    setPhone(numericPhone);
  }

  function validateStudentID() {
    return studentID.length === 6;
  }

  function validateFields() {
    if (
      validateStudentID() &&
      password.length >= 8 &&
      firstName.length > 0 &&
      lastName.length > 0 &&
      validateEmail() &&
      validatePhone()
    ) {
      setAllFieldsFilled(true);
    } else {
      setAllFieldsFilled(false);
    }
  }

  useEffect(() => {
    validateFields();
  }, [studentID, password, firstName, lastName, email, phone]);

  const signupDetails: SignupRequest = {
    uuid: studentID,
    password: password,
    email: email,
    phone: phone,
    firstName: firstName,
    lastName: lastName,
    id: studentID,
  };

  return (
    <Card>
      <Card.Title title="Signup" />
      <Card.Content>
        <Text>First Name</Text>
        <TextInput value={firstName} onChangeText={setFirstName} />
        <Text>Last Name</Text>
        <TextInput
          value={lastName}
          onChangeText={setLastName}
          autoCorrect={false}
        />
        <Text>Student ID</Text>
        <TextInput
          value={studentID}
          onChangeText={setStudentID}
          autoCorrect={false}
        />
        <Text>Email</Text>
        <TextInput
          value={email}
          onChangeText={setEmail}
          autoCapitalize="none"
        />
        <Text>Phone</Text>
        <PhoneNumberInput
          phoneNumber={phone}
          setPhoneNumber={setValidPhone}
          setCode={setCode} // US...
          code={code}
          limitMaxLength
          showFirstOnList={["US"]}
        />
        <Text>Password</Text>
        <PasswordTextInput password={password} setPassword={setPassword} />
        <Button
          mode="contained-tonal"
          onPress={() => {
            signup(signupDetails, setAuth).catch((error) => {
              console.log(error.message);
              alert(error.message);
            });
          }}
          disabled={!allFieldsFilled}
        >
          Signup
        </Button>
      </Card.Content>
    </Card>
  );
}
