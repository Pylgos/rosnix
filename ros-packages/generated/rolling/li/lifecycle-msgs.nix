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
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle_msgs";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "lifecycle_msgs" = substituteSource {
        src = fetchgit {
          name = "lifecycle_msgs-source";
          url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
          rev = "ddb42bf295aa855c6f8b4822093f54b0dfd2d1c9";
          hash = "sha256-+Oshm+4WjPL5fwRtPypcpz2zKiofzPFw2mbeEyzz9s4=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some lifecycle related message and service definitions.";
  };
})
