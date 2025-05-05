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
  pname = "delphi_mrr_msgs";
  version = "4.0.0-4";
  src = finalAttrs.passthru.sources."delphi_mrr_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "delphi_mrr_msgs" = substituteSource {
      src = fetchgit {
        name = "delphi_mrr_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "80133cae1505fb482f79e8d2465c8f28d0685ddf";
        hash = "sha256-wRjHKzZNBmMaEJPFEgEysXQ+9dMe3vyzYyFO3V+cuEs=";
      };
    };
  });
  meta = {
    description = "Message definitions for the Delphi MRR";
  };
})
