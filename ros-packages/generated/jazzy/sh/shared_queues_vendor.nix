{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ef7dfbf553288064347d51b8ac335f1ca489032a-vendor_source-1r7gpxhzr9sw3n8lgivv7jigi802scp53n3aig1pymp271r7bwdm = substituteSource {
      src = fetchzip {
        name = "ef7dfbf553288064347d51b8ac335f1ca489032a-vendor_source-1r7gpxhzr9sw3n8lgivv7jigi802scp53n3aig1pymp271r7bwdm-source";
        url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
        hash = "sha256-tfF1cjjiVn/Di2rYUS7TAqD4ojx7x0eRHVyn/GG/7+Q=";
      };
      substitutions = [
      ];
    };
    shared_queues_vendor-fea3a738733673c927d77631a735157993ff6395 = substituteSource {
      src = fetchgit {
        name = "shared_queues_vendor-fea3a738733673c927d77631a735157993ff6395-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "fea3a738733673c927d77631a735157993ff6395";
        hash = "sha256-2grePnrvPf9hev+nkF44pj7pyvZlyitshiL0aZhKT7o=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${ef7dfbf553288064347d51b8ac335f1ca489032a-vendor_source-1r7gpxhzr9sw3n8lgivv7jigi802scp53n3aig1pymp271r7bwdm}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "shared_queues_vendor";
  version = "0.26.5-1";
  src = sources.shared_queues_vendor-fea3a738733673c927d77631a735157993ff6395;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for concurrent queues from moodycamel";
  };
}
