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
  version = "1.3.0-1";
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
        rev = "420ad878ff7f9e438813c38cb12161e1e62d72c5";
        hash = "sha256-za1UK0zorduUOj57xb2I+NdgtD4jsHeQXbHaP4Hlqf0=";
      };
    };
  });
  meta = {
    description = "Autoware planning messages package.";
  };
})
