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
  version = "0.3.1-1";
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
        rev = "742790c4efe3e97a632dea13a34082ea0d215b7d";
        hash = "sha256-aLXlIx78da+51Thn5P3cJ6fW0e9+OhclX3xUHjpCesw=";
      };
    };
  });
  meta = {
    description = "ROS2 Interfaces for Kompass";
  };
})
