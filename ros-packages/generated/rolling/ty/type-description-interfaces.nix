{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "type_description_interfaces";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."type_description_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedNativeBuildInputs = [ rosidl-core-runtime service-msgs ];
  buildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "type_description_interfaces" = substituteSource {
      src = fetchgit {
        name = "type_description_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "de393f7d42e43e2ed86e763e2187ec099bb45eb4";
        hash = "sha256-PZ68TDZQA5AYoIKdGdPsUTSgXU2RDrr9hoLI/ddvUCM=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for describing and communicating descriptions of other types.";
  };
})
