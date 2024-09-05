import { User } from "@/auth/authModel";
import React from "react";
import { Card, Text } from "react-native-paper";

export function AdminDetailedUserInfo({ user }: { user: User }) {
  return (
    <>
      <Card>
        <Card.Title title={`${user.first_name} ${user.last_name}`} />
        <Card.Content>
          <Text>Student ID: {user.id}</Text>
          <Text>Email: {user.email}</Text>
          <Text>Phone: {user.phone}</Text>
          <Text>Current Points: {user.current_points}</Text>
        </Card.Content>
      </Card>
    </>
  );
}
