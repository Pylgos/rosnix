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
let
  sources = mkSourceSet (sources: {
    "type_description_interfaces" = substituteSource {
      src = fetchgit {
        name = "type_description_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "19c6e62afc4dc77010694e911d6f9c64373fa5fc";
        hash = "sha256-xUT46L5yIW2waiOgCH9yky8Mxz/On8iU3u1U4ZFJ5E4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "type_description_interfaces";
  version = "2.0.2-2";
  src = finalAttrs.passthru.sources."type_description_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-core-runtime service-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "A package containing message and service definitions for describing and communicating descriptions of other types.";
  };
})
