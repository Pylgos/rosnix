{
  action-msgs,
  ament-cmake,
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
  pname = "rosbridge_test_msgs";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."rosbridge_test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_test_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbridge_test_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "9ec320539f9841b2a6516e4b399ac17ae8592672";
        hash = "sha256-4NBk69hLCRYMC34o8IPGdNYNaTHr66iy7XFNdgtyELo=";
      };
    };
  });
  meta = {
    description = "\n    Message and service definitions used in internal tests for rosbridge packages.\n  ";
  };
})
