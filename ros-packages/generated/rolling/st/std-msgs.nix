{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "std_msgs";
  version = "5.5.0-1";
  src = finalAttrs.passthru.sources."std_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "std_msgs" = substituteSource {
      src = fetchgit {
        name = "std_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "1e112bcc4ff8484e6745774fb78a66d37028860c";
        hash = "sha256-X5kBZnkIMk8SEhSq+6UfeS/Vhyedm46kRNcfO3tXwEA=";
      };
    };
  });
  meta = {
    description = "A package containing some standard message definitions.";
  };
})
