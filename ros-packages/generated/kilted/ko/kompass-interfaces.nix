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
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kompass_interfaces";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."kompass_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "kompass_interfaces" = substituteSource {
      src = fetchgit {
        name = "kompass_interfaces-source";
        url = "https://github.com/ros2-gbp/kompass-release.git";
        rev = "1ed6e3fd1fa93929b2096bcc87f95fb2d4eb4276";
        hash = "sha256-U2ycmWvmoVT1odyE8ueKEF/BNh2hY3JkU+zcOmdHFlc=";
      };
    };
  });
  meta = {
    description = "ROS2 Interfaces for Kompass";
  };
})
