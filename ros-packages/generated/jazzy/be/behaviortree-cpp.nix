{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "behaviortree_cpp";
  version = "4.7.1-1";
  src = finalAttrs.passthru.sources."behaviortree_cpp";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libsqlite3-dev" "libzmq3-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ ament-index-cpp rclcpp ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" "libzmq3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "behaviortree_cpp" = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp-source";
        url = "https://github.com/ros2-gbp/behaviortree_cpp_v4-release.git";
        rev = "6ee155d14ff44c74a7d488e4013a826d9b135c82";
        hash = "sha256-Jm4Jk/hwJA4sWHjC1VQ1D4iHUu0DZwnVkrGiLxkJeZQ=";
      };
    };
  });
  meta = {
    description = "\n  This package provides the Behavior Trees core library.\n  ";
  };
})
