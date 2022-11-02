defmodule Api.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Api.Accounts.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 12:26:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 14:09:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 14:15:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 14:17:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 14:26:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        username: "some username"
      })
      |> Api.Accounts.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 14:34:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 14:43:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 14:58:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: ~N[2022-10-24 15:01:00],
        time: "some time"
      })
      |> Api.Accounts.create_clock()

    clock
  end

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        name: "some name",
      })
      |> Api.Accounts.create_team()

    team
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        role: "some role",
        team: "some team",
        username: "some username"
      })
      |> Api.Accounts.create_user()

    user
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        role: "some role",
        username: "some username"
      })
      |> Api.Accounts.create_user()

    user
  end
end
