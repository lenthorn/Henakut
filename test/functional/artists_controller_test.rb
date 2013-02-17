require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  setup do
    @artist = artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist" do
    assert_difference('Artist.count') do
      post :create, artist: { artistimage_url: @artist.artistimage_url, artistname: @artist.artistname, artstyle: @artist.artstyle, arttype: @artist.arttype, bio: @artist.bio, featuredartist: @artist.featuredartist }
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should show artist" do
    get :show, id: @artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist
    assert_response :success
  end

  test "should update artist" do
    put :update, id: @artist, artist: { artistimage_url: @artist.artistimage_url, artistname: @artist.artistname, artstyle: @artist.artstyle, arttype: @artist.arttype, bio: @artist.bio, featuredartist: @artist.featuredartist }
    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should destroy artist" do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end

    assert_redirected_to artists_path
  end
end
