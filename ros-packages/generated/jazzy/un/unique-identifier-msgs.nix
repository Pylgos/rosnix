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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "unique_identifier_msgs";
  version = "2.5.0-3";
  src = finalAttrs.passthru.sources."unique_identifier_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "unique_identifier_msgs" = substituteSource {
      src = fetchgit {
        name = "unique_identifier_msgs-source";
        url = "https://github.com/ros2-gbp/unique_identifier_msgs-release.git";
        rev = "8f82dd5c724dc222ac795630fcf8e32cc3c203b4";
        hash = "sha256-hqqiauecY9R4fqhisGA7JfZIm7RnqlOnb6/NhY2FsLg=";
      };
    };
  });
  meta = {
    description = "ROS messages for universally unique identifiers.";
  };
})
