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
  version = "0.3.2-1";
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
        rev = "184eedabfdd2aa8a6798c6ef3db2e5dfc87dda4a";
        hash = "sha256-pYXOROgDKyoVobyrm4UFRbaf6R2ze9bveNUiHxM0S9A=";
      };
    };
  });
  meta = {
    description = "ROS2 Interfaces for Kompass";
  };
})
