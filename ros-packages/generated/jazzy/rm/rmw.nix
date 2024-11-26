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
  version = "7.3.1-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "785f02ef6ccd4c863ddb665f39498a854c14d0a3";
        hash = "sha256-ytGuQrW/Nt8ZX9IJPoGLQCbkrs/QPjZxskxKOD2rLtU=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
