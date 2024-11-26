{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_planning_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."autoware_planning_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_planning_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_planning_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "ad37f985e38c1aa7910d7b171978aaf948a8c42a";
        hash = "sha256-b5dcWwQ5EYTKIPNbkzJamH/g7exRWH93Yd6P3jU6jvU=";
      };
    };
  });
  meta = {
    description = "Autoware planning messages package.";
  };
})
