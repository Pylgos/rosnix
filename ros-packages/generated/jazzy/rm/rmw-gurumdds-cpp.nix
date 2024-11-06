{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gurumdds-cmake-module,
  mkSourceSet,
  rcutils,
  rmw,
  rmw-dds-common,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-generator-dds-idl,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rmw_gurumdds_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_gurumdds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "a8e50153ea9e556770443138eca845ceb76ae32b";
        hash = "sha256-TJX8Mi7rXd5+2X83YBNsuDw9673aYlSe/99ZCeJ2IPo=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_gurumdds_cpp";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."rmw_gurumdds_cpp";
  nativeBuildInputs = [ ament-cmake-ros rosidl-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gurumdds-cmake-module rcutils rmw rmw-dds-common rosidl-generator-dds-idl rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gurumdds-3.2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Implement the ROS middleware interface using GurumNetworks GurumDDS static code generation in C++.";
  };
})
