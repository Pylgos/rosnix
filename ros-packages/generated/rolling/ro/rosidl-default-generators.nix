{
  action-msgs,
  ament-cmake,
  ament-cmake-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_default_generators";
  version = "1.9.0-1";
  src = finalAttrs.passthru.sources."rosidl_default_generators";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs ament-cmake-core rosidl-core-generators service-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs ament-cmake-core rosidl-core-generators service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_default_generators" = substituteSource {
      src = fetchgit {
        name = "rosidl_default_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "8841a091044eb1c8ff89b426990d5171ebe8ea54";
        hash = "sha256-sD7xHBc9INKGHAJFhGdgzFwhM5GDqNVuXu7qJu+Veug=";
      };
    };
  });
  meta = {
    description = "A configuration package defining the default ROS interface generators.";
  };
})
