{
  ament-cmake-auto,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-statistics-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_statistics";
  version = "2.6.3-1";
  src = finalAttrs.passthru.sources."pal_statistics";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ pal-statistics-msgs rclcpp rclcpp-lifecycle rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ pal-statistics-msgs rclcpp rclcpp-lifecycle rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_statistics" = substituteSource {
      src = fetchgit {
        name = "pal_statistics-source";
        url = "https://github.com/ros2-gbp/pal_statistics-release.git";
        rev = "83e21cb7f9df61d077fc8789d5390848c2329bff";
        hash = "sha256-8bCKohJkVdbcpShi1ffnAG9eL4Xp5/G7qHtVrWkAmA4=";
      };
    };
  });
  meta = {
    description = "The pal_statistics package";
  };
})
