export type LoginRequest = {
  uuid: string;
  password: string;
};

export type AuthModel = {
  jwt: string;
};

export type SessionModel = {
  auth: AuthModel | null;
  loading: boolean;
  user: User | null;
  logout: () => void;
  setAuth: (auth: AuthModel) => void;
  getUser: () => void;
};

export type User = {
  uuid: string;
  email: string;
  password: string;
  id: string;
  phone: string;
  first_name: string;
  last_name: string;
  purchases: Purchase[];
  current_points: number;
  admin: boolean;
}

export type Purchase = {
  datetime: string;
  id: string;
  properties: Object;
}

export type SignupRequest = {
  uuid: string;
  password: string;
  email: string;
  phone?: string;
  firstName: string;
  lastName: string;
  id: string; // this is studentID, and we will set id = uuid
};