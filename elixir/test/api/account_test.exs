defmodule Api.AccountTest do
  use Api.DataCase

  alias Api.Account

  describe "workingtime" do
    alias Api.Account.Workingtimes

    import Api.AccountFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtime/0 returns all workingtime" do
      workingtimes = workingtimes_fixture()
      assert Account.list_workingtime() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Account.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~U[2022-10-24 12:26:00Z], start: ~U[2022-10-24 12:26:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~U[2022-10-24 12:26:00Z]
      assert workingtimes.start == ~U[2022-10-24 12:26:00Z]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~U[2022-10-25 12:26:00Z], start: ~U[2022-10-25 12:26:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~U[2022-10-25 12:26:00Z]
      assert workingtimes.start == ~U[2022-10-25 12:26:00Z]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Account.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Account.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Account.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Account.change_workingtimes(workingtimes)
    end
  end

  describe "workingtime" do
    alias Api.Account.Workingtimes

    import Api.AccountFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtime/0 returns all workingtime" do
      workingtimes = workingtimes_fixture()
      assert Account.list_workingtime() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Account.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~U[2022-10-24 14:19:00Z], start: ~U[2022-10-24 14:19:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~U[2022-10-24 14:19:00Z]
      assert workingtimes.start == ~U[2022-10-24 14:19:00Z]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~U[2022-10-25 14:19:00Z], start: ~U[2022-10-25 14:19:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~U[2022-10-25 14:19:00Z]
      assert workingtimes.start == ~U[2022-10-25 14:19:00Z]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Account.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Account.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Account.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Account.change_workingtimes(workingtimes)
    end
  end

  describe "workingtime" do
    alias Api.Account.Workingtimes

    import Api.AccountFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtime/0 returns all workingtime" do
      workingtimes = workingtimes_fixture()
      assert Account.list_workingtime() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Account.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~U[2022-10-24 14:21:00Z], start: ~U[2022-10-24 14:21:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~U[2022-10-24 14:21:00Z]
      assert workingtimes.start == ~U[2022-10-24 14:21:00Z]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~U[2022-10-25 14:21:00Z], start: ~U[2022-10-25 14:21:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~U[2022-10-25 14:21:00Z]
      assert workingtimes.start == ~U[2022-10-25 14:21:00Z]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Account.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Account.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Account.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Account.change_workingtimes(workingtimes)
    end
  end

  describe "workingtime" do
    alias Api.Account.Workingtimes

    import Api.AccountFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtime/0 returns all workingtime" do
      workingtimes = workingtimes_fixture()
      assert Account.list_workingtime() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Account.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~U[2022-10-24 14:36:00Z], start: ~U[2022-10-24 14:36:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~U[2022-10-24 14:36:00Z]
      assert workingtimes.start == ~U[2022-10-24 14:36:00Z]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~U[2022-10-25 14:36:00Z], start: ~U[2022-10-25 14:36:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~U[2022-10-25 14:36:00Z]
      assert workingtimes.start == ~U[2022-10-25 14:36:00Z]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Account.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Account.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Account.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Account.change_workingtimes(workingtimes)
    end
  end

  describe "workingtime" do
    alias Api.Account.Workingtimes

    import Api.AccountFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtime/0 returns all workingtime" do
      workingtimes = workingtimes_fixture()
      assert Account.list_workingtime() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Account.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~U[2022-10-24 14:44:00Z], start: ~U[2022-10-24 14:44:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~U[2022-10-24 14:44:00Z]
      assert workingtimes.start == ~U[2022-10-24 14:44:00Z]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~U[2022-10-25 14:44:00Z], start: ~U[2022-10-25 14:44:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~U[2022-10-25 14:44:00Z]
      assert workingtimes.start == ~U[2022-10-25 14:44:00Z]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Account.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Account.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Account.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Account.change_workingtimes(workingtimes)
    end
  end

  describe "workingtime" do
    alias Api.Account.Workingtimes

    import Api.AccountFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtime/0 returns all workingtime" do
      workingtimes = workingtimes_fixture()
      assert Account.list_workingtime() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Account.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~U[2022-10-24 15:01:00Z], start: ~U[2022-10-24 15:01:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~U[2022-10-24 15:01:00Z]
      assert workingtimes.start == ~U[2022-10-24 15:01:00Z]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~U[2022-10-25 15:01:00Z], start: ~U[2022-10-25 15:01:00Z]}

      assert {:ok, %Workingtimes{} = workingtimes} = Account.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~U[2022-10-25 15:01:00Z]
      assert workingtimes.start == ~U[2022-10-25 15:01:00Z]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Account.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Account.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Account.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Account.change_workingtimes(workingtimes)
    end
  end
end
