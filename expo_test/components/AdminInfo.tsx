import React, { useEffect } from "react";
import { Card, Text } from "react-native-paper";
import { useAuth } from "./Auth";
import { Logout } from "./Logout";

export function AdminInfo() {
  const { user, getUser } = useAuth();

  useEffect(() => {
    getUser();
  }, []);

  if (!user) {
    return <Logout />;
  }

  const name = `${user.first_name} ${user.last_name}`;
  return (
    <>
      <Card>
        <Card.Title title={name} />
        <Logout />
      </Card>
    </>
  );
}
