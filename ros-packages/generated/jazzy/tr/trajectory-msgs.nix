{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "trajectory_msgs";
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."trajectory_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "trajectory_msgs" = substituteSource {
        src = fetchgit {
          name = "trajectory_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "c19aea6c1d72c99aa397289cfcd19213576948ea";
          hash = "sha256-7CDVCo1MH2SjEg2UKfl2N4aU4ygYOLtn8EhASs6E/pE=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some robot trajectory message definitions.";
  };
})
