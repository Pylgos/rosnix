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
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_interfaces";
  version = "5.0.1-2";
  src = finalAttrs.passthru.sources."point_cloud_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_interfaces" = substituteSource {
      src = fetchgit {
        name = "point_cloud_interfaces-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "fe870e5a68db402cc77d3c4e87011a7cfc5c2fea";
        hash = "sha256-hijq0cE+AbzE2YCfnlqxbEHL/9OsqrR5Nv35rDhX7Vw=";
      };
    };
  });
  meta = {
    description = "\n    msg definitions for use with point_cloud_transport plugins.\n  ";
  };
})
