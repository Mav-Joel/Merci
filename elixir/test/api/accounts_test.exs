defmodule Api.AccountsTest do
  use Api.DataCase

  alias Api.Accounts

  describe "users" do
    alias Api.Accounts.User

    import Api.AccountsFixtures

    @invalid_attrs %{email: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 12:26:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 12:26:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 12:26:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 12:26:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 14:09:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 14:09:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 14:09:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 14:09:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 14:15:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 14:15:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 14:15:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 14:15:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 14:17:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 14:17:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 14:17:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 14:17:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 14:26:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 14:26:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 14:26:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 14:26:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "users" do
    alias Api.Accounts.User

    import Api.AccountsFixtures

    @invalid_attrs %{email: nil, password: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", password: "some password", username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", password: "some updated password", username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 14:34:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 14:34:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 14:34:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 14:34:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 14:43:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 14:43:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 14:43:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 14:43:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 14:58:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 14:58:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 14:58:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 14:58:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "clocks" do
    alias Api.Accounts.Clock

    import Api.AccountsFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Accounts.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Accounts.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: ~N[2022-10-24 15:01:00], time: "some time"}

      assert {:ok, %Clock{} = clock} = Accounts.create_clock(valid_attrs)
      assert clock.status == ~N[2022-10-24 15:01:00]
      assert clock.time == "some time"
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: ~N[2022-10-25 15:01:00], time: "some updated time"}

      assert {:ok, %Clock{} = clock} = Accounts.update_clock(clock, update_attrs)
      assert clock.status == ~N[2022-10-25 15:01:00]
      assert clock.time == "some updated time"
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clock(clock, @invalid_attrs)
      assert clock == Accounts.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Accounts.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clock(clock)
    end
  end

  describe "team" do
    alias Api.Accounts.Team

    import Api.AccountsFixtures

    @invalid_attrs %{name: nil}

    test "list_team/0 returns all team" do
      team = team_fixture()
      assert Accounts.list_team() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Accounts.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Team{} = team} = Accounts.create_team(valid_attrs)
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()

      assert {:ok, %Team{} = team} = Accounts.update_team(team, update_attrs)
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_team(team, @invalid_attrs)
      assert team == Accounts.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Accounts.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Accounts.change_team(team)
    end
  end

  describe "users" do
    alias Api.Accounts.User

    import Api.AccountsFixtures

    @invalid_attrs %{email: nil, password: nil, role: nil, team: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", password: "some password", role: "some role", team: "some team", username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.team == "some team"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", password: "some updated password", role: "some updated role", team: "some updated team", username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.role == "some updated role"
      assert user.team == "some updated team"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias Api.Accounts.User

    import Api.AccountsFixtures

    @invalid_attrs %{email: nil, password: nil, role: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", password: "some password", role: "some role", username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", password: "some updated password", role: "some updated role", username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.role == "some updated role"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias Api.Accounts.User

    import Api.AccountsFixtures

    @invalid_attrs %{email: nil, password: nil, role: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", password: "some password", role: "some role", username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", password: "some updated password", role: "some updated role", username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.role == "some updated role"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
