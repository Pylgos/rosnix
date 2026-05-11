{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-ros-core,
  ament-cmake-version,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcutils,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw";
  version = "7.11.0-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ament-cmake-version ];
  propagatedNativeBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "4b4f9334937d8ca30cd628f8045a881f528cbf76";
        hash = "sha256-njzZ33Px1z2VzYVi9SuucXlcvCyzPKJ/o3NatZvv9RM=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
