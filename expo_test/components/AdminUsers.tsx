import { AuthModel, User } from "@/auth/authModel";
import { searchUsers } from "@/auth/searchUsers";
import React, { useState } from "react";
import {
  Button,
  Card,
  Text,
  TextInput,
  TouchableRipple,
} from "react-native-paper";
import { useAuth } from "./Auth";
import { Link, router } from "expo-router";
import { ScrollView } from "react-native";

export function AdminUsers() {
  const [search, setSearch] = useState("");
  const [searchResults, setSearchResults] = useState<User[]>([]);

  const { auth } = useAuth();
  return (
    <>
      <Card>
        <Card.Title title="Search Users" />
        <Card.Content>
          <SearchUsers search={search} setSearch={setSearch} />
          <SubmitUserSearch
            search={search}
            setSearchResults={setSearchResults}
            auth={auth}
          />
        </Card.Content>
      </Card>
      <ScrollView>
        {searchResults.map((user) => (
          <UserCard key={user.uuid} user={user} />
        ))}
      </ScrollView>
    </>
  );
}

function SubmitUserSearch({
  search,
  setSearchResults,
  auth,
}: {
  search: string;
  setSearchResults: (users: User[]) => void;
  auth: AuthModel | null;
}) {
  async function searchUsersAndSetResults() {
    if (auth === null) {
      return;
    }
    const results = await searchUsers(search, auth);
    if (results === null) {
      return;
    }
    setSearchResults(results);
  }

  return (
    <Button mode="contained" onPress={searchUsersAndSetResults}>
      Search
    </Button>
  );
}

function SearchUsers({
  search,
  setSearch,
}: {
  search: string;
  setSearch: (search: string) => void;
}) {
  return (
    <TextInput
      label="Search"
      mode="outlined"
      placeholder="Enter Student ID"
      onChangeText={setSearch}
      value={search}
    />
  );
}

function UserCard({ user }: { user: User }) {
  function handlePress() {
    router.push(`/userInfo/${user.uuid}`);
  }

  return (
    <TouchableRipple onPress={handlePress}>
      <Card>
        <Card.Title
          title={`${user.first_name} ${user.last_name}`}
          subtitle={user.uuid}
        />
        <Card.Content>
          <Text>{user.email}</Text>
          <Text>{user.phone}</Text>
        </Card.Content>
      </Card>
    </TouchableRipple>
  );
}
