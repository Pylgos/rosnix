{
  ament-cmake-gmock,
  ament-cmake-ros,
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
  version = "7.3.3-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedNativeBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  buildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "6ce768e1f1768e02d67dc486a7860eb4493dfe3c";
        hash = "sha256-lWw8IWNv26BNCuVPDfQ7xz6EGNaPkGyGovAjAoZtLIY=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
