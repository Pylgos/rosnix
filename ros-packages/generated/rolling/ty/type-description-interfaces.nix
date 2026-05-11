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
  version = "2.5.0-1";
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
        rev = "6cc40a46a1bce26f3610b945f79d3ec58434430f";
        hash = "sha256-CcYf7qg7FGRkHaj8mKfWwY4lWuyCk79+WpX1PLn4V+M=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for describing and communicating descriptions of other types.";
  };
})
