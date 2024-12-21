{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_parser_plugin";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."urdf_parser_plugin";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ urdfdom-headers ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_parser_plugin" = substituteSource {
      src = fetchgit {
        name = "urdf_parser_plugin-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "86b3ae8cd192ff999428c49e4ee0a5f9ef01c874";
        hash = "sha256-Pg6ua0G8PcTcvRChGmICvkICEJDRjT2nYuMmDyCffSY=";
      };
    };
  });
  meta = {
    description = "This package contains a C++ base class for URDF parsers.";
  };
})
