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
  version = "4.7.2-1";
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
        rev = "9ee455b23a4f23609ac587ed684b502f860d4902";
        hash = "sha256-5o1PCui08DRssx8nQ1p5AqvIcdne+fXPxfwyrmNIeO4=";
      };
    };
  });
  meta = {
    description = "\n  This package provides the Behavior Trees core library.\n  ";
  };
})
