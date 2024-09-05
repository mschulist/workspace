import React, { useEffect } from "react";
import { ActivityIndicator, Card, Text } from "react-native-paper";
import { useAuth } from "./Auth";
import { Logout } from "./Logout";

export function UserInfo() {
  const { user, getUser } = useAuth();

  useEffect(() => {
    getUser();
  }, []);

  if (!user) {
    return <ActivityIndicator />;
  }

  const name = `${user.first_name} ${user.last_name}`;
  return (
    <>
      <Card>
        <Card.Title title={name} />
        <Card.Content>
          <Text>Student ID: {user.id}</Text>
          <Text>Email: {user.email}</Text>
          <Text>Phone: {user.phone}</Text>
          <Text>Current Points: {user.current_points}</Text>
        </Card.Content>
      </Card>
      <Card>
        <Logout />
      </Card>
    </>
  );
}
