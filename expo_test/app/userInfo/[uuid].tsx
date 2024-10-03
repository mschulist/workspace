import { User } from "@/auth/authModel";
import { searchUsers } from "@/auth/searchUsers";
import { useAuth } from "@/components/Auth";
import { router, useLocalSearchParams } from "expo-router";
import React, { useEffect, useState, useCallback } from "react";
import { Card, Text, ActivityIndicator, Button } from "react-native-paper";
import { ScrollView, RefreshControl, StyleSheet, View } from "react-native";
import { AdminAddPurchase } from "@/components/AdminAddPurchase";
import { AdminRedeem } from "@/components/AdminRedeem";

export default function UserInfo() {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [refreshing, setRefreshing] = useState<boolean>(false);

  const { auth } = useAuth();
  const { uuid } = useLocalSearchParams();

  console.log("user", user);
  console.log("uuid", uuid);

  // Function to fetch user information
  const fetchUserInfo = useCallback(async () => {
    if (typeof uuid !== "string" || !auth) return;

    setLoading(true);
    try {
      const users = await searchUsers(uuid, auth);
      console.log("users", users);
      if (users.length > 0) {
        setUser(users[0]);
      }
    } catch (error) {
      console.error("Failed to fetch user info:", error);
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }, [uuid, auth]);

  // Fetch user information when component mounts
  useEffect(() => {
    fetchUserInfo();
  }, [fetchUserInfo]);

  // Handle pull-to-refresh
  const onRefresh = useCallback(() => {
    setRefreshing(true);
    fetchUserInfo();
  }, [fetchUserInfo]);

  if (typeof uuid !== "string") {
    return <Text>Invalid UUID</Text>;
  }

  if (!auth) {
    return <Text>Not logged in</Text>;
  }

  if (loading) {
    return <ActivityIndicator />;
  }

  const name = user ? `${user.first_name} ${user.last_name}` : "User not found";

  return (
    <View style={styles.container}>
      <BackButton />
      <ScrollView
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
        }
      >
        {user ? (
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
            <AdminAddPurchase user={user} />
            <AdminRedeem user={user} />
          </>
        ) : (
          <Text>No user found</Text>
        )}
      </ScrollView>
    </View>
  );
}

export function BackButton() {
  return (
    <Button
      icon="arrow-left"
      onPress={() => {
        router.back();
      }}
      mode="contained-tonal"
      style={{ position: "absolute", top: -50 }}
    >
      Back
    </Button>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    marginTop: 100,
    marginHorizontal: 16,
  },
});
