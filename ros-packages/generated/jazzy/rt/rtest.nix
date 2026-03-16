{
  action-msgs,
  ament-clang-tidy,
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gmock-vendor,
  mkSourceSet,
  rcl,
  rcl-action,
  rclcpp,
  rclcpp-action,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtest";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."rtest";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ action-msgs gmock-vendor rcl rcl-action rclcpp rclcpp-action ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libgmock-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ action-msgs gmock-vendor rcl rcl-action rclcpp rclcpp-action ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libgmock-dev" ]; };
  checkInputs = [ ament-clang-tidy ament-cmake-copyright ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rtest" = substituteSource {
      src = fetchgit {
        name = "rtest-source";
        url = "https://github.com/ros2-gbp/rtest-release.git";
        rev = "481f8fe303b8769572d2b58137671e4d1c5d64e1";
        hash = "sha256-yk0rvUL5eYx/0RpPN+3hkU/YeTq4YeV1z1bHWHH0vz0=";
      };
    };
  });
  meta = {
    description = "This framework enables writing reliable, fully repeatable tests for C++ ROS 2 implementations.";
  };
})
