{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_interface";
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_interface" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "fa7541e2676ab83846e8e9275491d5c55b4b01da";
        hash = "sha256-XpjvME5nCWC1UtldXwU+YJMvl6f8tZPwTLOjgYoLZsM=";
      };
    };
  });
  meta = {
    description = "\n    The interface for rosidl typesupport packages.\n  ";
  };
})
