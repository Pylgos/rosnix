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
  version = "5.2.0-2";
  src = finalAttrs.passthru.sources."rosidl_typesupport_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_interface" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "f7cbd76d63fb180331e2a6df882053afca423a86";
        hash = "sha256-2zpJUcQ9dvyQ4gWs6Nze32G+Wpb5rIUW5xm/KEupLYE=";
      };
    };
  });
  meta = {
    description = "\n    The interface for rosidl typesupport packages.\n  ";
  };
})
