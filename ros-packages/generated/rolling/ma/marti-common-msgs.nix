{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_common_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_common_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_common_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_common_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "f1cdbcbd211ef0a98106d5f0cd0e347bfe7721af";
        hash = "sha256-N4Z+x0Qn74ATmU9Bo/KkNEKCi0vdy+RNRuBNCeP7eWE=";
      };
    };
  });
  meta = {
    description = "\n\n     marti_common_msgs\n\n  ";
  };
})
