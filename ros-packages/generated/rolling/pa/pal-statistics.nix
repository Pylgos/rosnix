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
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."pal_statistics";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ pal-statistics-msgs rclcpp rclcpp-lifecycle rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_statistics" = substituteSource {
      src = fetchgit {
        name = "pal_statistics-source";
        url = "https://github.com/ros2-gbp/pal_statistics-release.git";
        rev = "c465138a296f21a02572a1ade54569d05bca1e52";
        hash = "sha256-CxtuO7a7m5VQ5nAX1BCRUBMJpRpsr6waBi0Ln+Ulao4=";
      };
    };
  });
  meta = {
    description = "The pal_statistics package";
  };
})
