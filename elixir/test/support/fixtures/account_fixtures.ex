defmodule Api.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Account` context.
  """

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~U[2022-10-24 12:26:00Z],
        start: ~U[2022-10-24 12:26:00Z]
      })
      |> Api.Accounts.create_workingtimes()

    workingtimes
  end

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~U[2022-10-24 14:19:00Z],
        start: ~U[2022-10-24 14:19:00Z]
      })
      |> Api.Accounts.create_workingtimes()

    workingtimes
  end

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~U[2022-10-24 14:21:00Z],
        start: ~U[2022-10-24 14:21:00Z]
      })
      |> Api.Accounts.create_workingtimes()

    workingtimes
  end

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~U[2022-10-24 14:36:00Z],
        start: ~U[2022-10-24 14:36:00Z]
      })
      |> Api.Accounts.create_workingtimes()

    workingtimes
  end

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~U[2022-10-24 14:44:00Z],
        start: ~U[2022-10-24 14:44:00Z]
      })
      |> Api.Accounts.create_workingtimes()

    workingtimes
  end

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~U[2022-10-24 15:01:00Z],
        start: ~U[2022-10-24 15:01:00Z]
      })
      |> Api.Accounts.create_workingtimes()

    workingtimes
  end
end
