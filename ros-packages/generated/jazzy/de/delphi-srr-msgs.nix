{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "delphi_srr_msgs";
  version = "4.0.0-4";
  src = finalAttrs.passthru.sources."delphi_srr_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "delphi_srr_msgs" = substituteSource {
        src = fetchgit {
          name = "delphi_srr_msgs-source";
          url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
          rev = "884b29c9fe2ee84935864b270cff7751791ecf3f";
          hash = "sha256-Vu/trELYAZeFsNU7L9/L1c/gwv48ZdARSjJ1HkujJaU=";
        };
      };
    });
  };
  meta = {
    description = "Message definitions for the Delphi SRR";
  };
})
