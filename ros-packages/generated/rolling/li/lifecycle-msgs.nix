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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_msgs" = substituteSource {
      src = fetchgit {
        name = "lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "f53cc666b809552b50268ceb89b46851d8397a76";
        hash = "sha256-oQ0cIff7oEs1vJPBkg3lqcbs4+1StcoPD8UVwjxWo6o=";
      };
    };
  });
  meta = {
    description = "A package containing some lifecycle related message and service definitions.";
  };
})
