import { useAuth } from "@/components/Auth";
import { Logout } from "@/components/Logout";
import React from "react";
import { Card, Text } from "react-native-paper";

export default function Index() {
  const { user } = useAuth();
  console.log("user", user);
  return (
    <>
      <Card>
        <Text>Welcome to Expo Test!</Text>
        <Logout />
        {user && <Text>{JSON.stringify(user)}</Text>}
      </Card>
    </>
  );
}
