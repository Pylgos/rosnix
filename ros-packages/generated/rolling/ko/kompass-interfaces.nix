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
  version = "0.3.0-1";
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
        rev = "f4cbb2b216e3124278eaac978e4115bedfa33535";
        hash = "sha256-kXC7nOSiEuKN5Mi87PaA2TEnRT6PQJxa6zVgTyak0f4=";
      };
    };
  });
  meta = {
    description = "ROS2 Interfaces for Kompass";
  };
})
