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
  version = "7.3.2-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "222493cfcde420c1b3c9b4f65e9442848d10730c";
        hash = "sha256-8hioCZyoaLORAGpzdknNbkzwh2Pu0qwliaW2QIOVs4o=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
